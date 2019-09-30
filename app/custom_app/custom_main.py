from fastapi import FastAPI
# import uvicorn

api = FastAPI()


@api.get("/api/v1/legalEntities")
async def read_root():
    return {"Test kiss": "STAR WARS PACKAGE MADE SOME CHANGES"}


# if __name__ == '__main__':
#     uvicorn.run(api, host="0.0.0.0", port=8000)
