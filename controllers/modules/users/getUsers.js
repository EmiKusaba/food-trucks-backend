const connection = require("../../../postgres/connection");

const getUsers = (req, res) => {
  connection.query("SELECT id, name FROM users ORDER BY 1", (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(result.rows);
  })
};

module.exports = getUsers;