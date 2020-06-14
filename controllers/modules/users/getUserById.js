const connection = require("../../../postgres/connection");

const getUserById = (req, res) => {
  const id = parseInt(req.params.id);

  connection.query("SELECT * FROM users WHERE id = $1", [id], (err, rows) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(rows);
  })
};

module.exports = getUserById;