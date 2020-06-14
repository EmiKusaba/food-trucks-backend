const connection = require("../../../postgres/connection");

const getUserByName = (req, res) => {
  const name = req.params.name;

  connection.query("SELECT * FROM users WHERE name = $1", [name], (err, rows) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(rows);
  })
};

module.exports = getUserByName;