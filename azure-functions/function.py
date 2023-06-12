import datetime
import azure.functions as func


def main(req: func.HttpRequest) -> func.HttpResponse:    
    now = datetime.datetime.now().strftime("%Y-%m-%D %H:%M:%S")
    return func.HttpResponse(f"Witaj, aktualny czas {now}!")