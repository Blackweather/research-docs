FROM python:3.8-slim
ADD docs/ .
RUN pip install mkdocs
ENTRYPOINT [ "mkdocs", "serve" ]