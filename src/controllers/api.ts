import { ApiInterface } from "./apiTypes";
import { Response, Request } from "express";

/**
 * GET /api
 * List of API examples.
 */
const getApi = (req: Request, res: Response) => {
  const key = req?.params?.key;

  res.json({
    data: `Hello world: ${key}`
  });
};

const postApi = (req: Request, res: Response) => {
  console.log("req", req);

  res.json({
    data: "Hello world this is posts"
  });
};

const routes: Array<ApiInterface> = [
  {
    method: "get",
    route: "/apis/test/:key",
    callbackFn: getApi
  },
  {
    method: "post",
    route: "/apis/test/:key",
    callbackFn: postApi
  }
];

export default routes;
