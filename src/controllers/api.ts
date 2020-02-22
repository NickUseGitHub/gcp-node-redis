import { ApiInterface } from "./apiTypes";
import { Response, Request } from "express";
// import RedisConn from "../util/connectors";

const echoApi = (req: Request, res: Response) => {
  res.send("This is app apis");
};

const helloApi = (req: Request, res: Response) => {
  res.send("Hello world");
};

/**
 * GET /api
 * List of API examples.
 */
// const getApi = (req: Request, res: Response) => {
//   const key = req?.params?.key;
//   const value = req?.params?.value;

//   RedisConn.set(key, value);

//   res.json({
//     data: `Hello world: key[${key}]: ${value}`
//   });
// };

// const postApi = async (req: Request, res: Response) => {
//   const key = req?.params?.key;

//   const value = await RedisConn.get(key);
//   console.log("value", value);

//   res.json({
//     data: `key[${key}]: ${value}`
//   });
// };

const routes: Array<ApiInterface> = [
  {
    method: "get",
    route: "/hello",
    callbackFn: helloApi
  },
  {
    method: "get",
    route: "/",
    callbackFn: echoApi
  }
  // {
  //   method: "get",
  //   route: "/apis/test/:key/:value",
  //   callbackFn: getApi
  // },
  // {
  //   method: "post",
  //   route: "/apis/test/:key",
  //   callbackFn: postApi
  // }
];

export default routes;
