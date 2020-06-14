const connection = require("../../../postgres/connection");

const getEntreesByTruckId = (req, res) => {
  const truckId = parseInt(req.params.id);

  connection.query("SELECT * FROM entrees WHERE truck_id = $1 ORDER BY id", [truckId], (err, rows) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }
    return res.json(rows);
  })
};

module.exports = getEntreesByTruckId;