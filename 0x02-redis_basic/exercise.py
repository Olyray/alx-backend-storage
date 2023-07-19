#!/usr/bin/env python3
"""A python script to transfer a string to the Redis cache"""


import redis
import uuid
from typing import Union


class Cache:
    """A cache class to transfer a string to redis"""
    def __init__(self):
        """Initializes a cache instance of redis"""
        self._redis = redis.Redis()
        self._redis.flushdb()

    def store(self, data: Union[str, bytes, int, float]) -> str:
        """Adds a value to the redis cache and returns a string"""
        random_key = str(uuid.uuid4())
        self._redis.set(random_key, data)
        return random_key
