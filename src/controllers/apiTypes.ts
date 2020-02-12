import { Response, Request } from "express";

export interface ApiInterface {
  method: string;
  route: string;
  callbackFn: (req: Request, res: Response) => void;
}
