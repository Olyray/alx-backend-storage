#!/usr/bin/env python3
class OuterClass:
    def outer_method(self):
        def inner_method():
            print(inner_method.__qualname__)

        inner_method()


outer = OuterClass()
outer.outer_method()
