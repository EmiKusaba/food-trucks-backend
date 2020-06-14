const connection = require("../../../postgres/connection");

const getTrucks = (req, res) => {
  connection.query("SELECT id, name FROM trucks ORDER BY 1", (err, rows) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(rows);
  })
};

module.exports = getTrucks;