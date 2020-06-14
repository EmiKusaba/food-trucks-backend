const connection = require("../../../postgres/connection");

const getTruckById = (req, res) => {
  const id = parseInt(req.params.id);

  connection.query("SELECT * FROM trucks WHERE id = $1", [id], (err, rows) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(rows);
  })
};

module.exports = getTruckById;