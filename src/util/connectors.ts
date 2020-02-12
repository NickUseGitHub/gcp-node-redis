import redis, { RedisClient } from "redis";
import { promisify } from "util";

class RedisCon {
  private static instance: RedisCon;
  private client: RedisClient;

  constructor() {
    if (typeof RedisCon.instance === "object") {
      return RedisCon.instance;
    }

    this.connectToRedis();
    this.get = promisify(this.client.get).bind(this.client);

    RedisCon.instance = this;
    return this;
  }

  connectToRedis() {
    this.client = redis.createClient({
      host: "localhost"
    });
  }

  set(key: string, value: string) {
    this.client.set(key, value);
  }

  get(key: string) {
    return this.client.get(key);
  }
}

export default new RedisCon();
