const { db } = require('../config/conn')

module.exports = {
  // query for all comments
  index() {
    return db.manyOrNone(`
    SELECT *
    FROM comments
    `)
  },
  // query for one comment
  getOneComment(id) {
    return db.one(`
    SELECT *
    FROM comments
    WHERE id = $1`, id)
  },
  // create comment
  createComment(data) {
    return db.one(`
    INSERT INTO comments
    (content, post_id, user_id)
    VALUES
    ($/content/, $/post_id/, $/user_id)`, data)
  },
  // update one comment
  updateCOmment(id) {
    return db.one(`
    UPDATE comments
    SET
    content = $/content/`)
  },
  // delete one comment
  deleteComment(id) {
    return db.none(`
    DELETE FROM comments
    WHERE id = $1`, id);
  }
}
