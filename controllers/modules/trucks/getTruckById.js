const connection = require("../../../postgres/connection");

const getTruckById = (req, res) => {
  const id = parseInt(req.params.id);

  connection.query("select t.*, c.name as category from trucks t join truck_categories tc on t.id = tc.truck_id join categories c on tc.category_id = c.id where t.id = $1", [id], (err, result) => {
    if(err) {
      return res.status(500).send(`Error: ${err}`);
    }

    return res.json(result.rows);
  })
};

module.exports = getTruckById;