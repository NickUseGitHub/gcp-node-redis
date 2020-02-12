import express from "express";
import bodyParser from "body-parser";
import { ApiInterface } from "./controllers/apiTypes";

import "./util/secrets";
import "./util/connectors";

// Controllers (route handlers)
import apiRoutes from "./controllers/api";

// Create Express server
const app = express();

// Express configuration
app.set("port", process.env.PORT || 3000);
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));

/**
 * API examples routes.
 */
apiRoutes.forEach((apiRoute: ApiInterface) => {
  switch (apiRoute.method) {
    case "get":
      app.get(apiRoute.route, apiRoute.callbackFn);
      break;
    case "post":
      app.post(apiRoute.route, apiRoute.callbackFn);
      break;
  }
});

export default app;
