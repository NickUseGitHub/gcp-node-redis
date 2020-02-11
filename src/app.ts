import express from "express";
import bodyParser from "body-parser";

import "./util/secrets";

// Controllers (route handlers)
import * as apiController from "./controllers/api";

// Create Express server
const app = express();

// Express configuration
app.set("port", process.env.PORT || 3000);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

/**
 * API examples routes.
 */
app.get("/apis", apiController.getApi);

export default app;
