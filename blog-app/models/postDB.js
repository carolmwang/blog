const { db } = require('../config/conn');

module.exports = {
  // get one post
  index() {
    return db.manyOrNone(`
    SELECT *
    FROM posts
    `);
  },

  // get all posts by category
  allPostByCategory(category) {
    return db.manyOrNone(`
    SELECT *
    FROM posts
    WHERE category = $1`, category);
  },

  // get all posts by user
  allPostsByUser(user) {
    return db.manyOrNone(`
    SELECT *
    FROM posts
    WHERE user_id = $1`, id);
  },

  // get post by id
  onePost(id) {
    return db.one(`
    SELECT *
    FROM posts
    WHERE id = $1`, id);
  },

  // create post
  createPost(post) {
    return db.one(`
    INSERT INTO post
    (title, content, category, user_id)
    VALUES
    ($/title/, $/content/, $/category/, $/user_id/)
    `, post)
  },

  // update post
  updatePost(post) {
    return db.one(`
    UPDATE posts
    SET
    (title = $/title/, 
    content = $/content/, 
    category = $/category/)`, post);
  },

  // delete post
  deletePost(id) {
    return db.none(`
    DELETE FROM post
    WHERE id = $1`, id)
  }
}