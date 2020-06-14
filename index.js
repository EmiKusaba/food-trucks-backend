const express = require("express");
const app = express();

const trucksRouter = require("./routes/trucks");
const usersRouter = require("./routes/users");

const port = process.env.PORT || 4001;

app.get("/", (req, res) => {
  res.send("Welcome to food-trucks-backend!");
});

app.use("/trucks", trucksRouter);
app.use("/users", usersRouter);

app.listen(port, () => {
  console.log(`Web server listening on ${port}`);
});

