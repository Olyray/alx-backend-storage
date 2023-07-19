#!/usr/bin/env python3
"""A python script to transfer a string to the Redis cache"""


import redis
import uuid
from typing import Union, Callable


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

    def get(self, key: str, fn: Callable = None) -> Union[str, bytes, int, float]:
        """Returns the type passed in the callable function"""
        value = self._redis.get(key)
        return fn(value) if fn is not None else value
    
    def get_str(self, key: str):
        """Calls the get method using a string"""
        return self.get(key, str)

    def get_int(self, key: str):
        """Calls the get method using an int"""
        return self.get(key, int)
