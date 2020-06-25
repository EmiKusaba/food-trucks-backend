const pg = require("pg");

// heroku pg:psql -a foodtruckstracker-backend

class Connection {
  constructor() {
    if(!this.pool) {
      console.log("Creating postgres connection...");
      this.pool = new pg.Pool({
        user: "swcdxkwiiybsxx",
        host: "ec2-52-44-166-58.compute-1.amazonaws.com",
        database: "d5fcst2i2t1uio",
        password: "88f271e18b33fa81dc4af9543e93ad776dfc149d84599f94a60a6abb535ca0d4",
        port: 5432,
        ssl: {rejectUnauthorized: false},
      });
    }
    return this.pool;
  }
}

const instance = new Connection();

module.exports = instance;

