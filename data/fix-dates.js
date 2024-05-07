use('education')

function fixDates() {
    let maxdate = db.grades.aggregate([{
            "$sort": {
                "date_completed": -1
            }
        },
        {
            "$limit": 1
        },
        {
            "$project": {
                "max_date_completed": "$date_completed",
                "_id": 0
            }
        }
    ]).toArray()[0]["max_date_completed"];


    let pipeline = [{
            "$addFields": {
                "diff": {
                    "$dateDiff": {
                        "startDate": maxdate,
                        "endDate": "$$NOW",
                        "unit": "day"
                    }
                }
            }
        },
        {
            "$set": {
                "date_assigned": {
                    "$dateAdd": {
                        "startDate": "$date_assigned",
                        "unit": "day",
                        "amount": {
                            "$subtract": ["$diff", 1]
                        }
                    }
                },
                "date_completed": {
                    "$cond": {
                        "if": {
                            "$eq": ["$status", "complete"]
                        },
                        "then": {
                            "$dateAdd": {
                                "startDate": "$date_completed",
                                "unit": "day",
                                "amount": {
                                    "$subtract": ["$diff", 1]
                                }
                            }
                        },
                        "else": null
                    }

                }
            }
        },
        {
            "$unset": "diff"
        }
    ];


    result = db.grades.updateMany({}, pipeline)
    console.log(JSON.stringify(result))
}


fixDates()