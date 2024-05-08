
use('education')
// Connect to the specific database
if(!db.grades.getIndexes().some((index) => index.key["date_completed"] === 1)) {
  db.grades.createIndex({ "date_completed": 1 })
}


