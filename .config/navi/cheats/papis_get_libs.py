from papis import api

for lib in api.get_libraries():
    print(lib)
