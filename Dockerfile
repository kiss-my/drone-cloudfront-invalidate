FROM python:3.7-stretch 

LABEL maintainer="kiss my <open@kissmy.dev>" \
  org.label-schema.name="Drone CloudFront Invalidate" \
  org.label-schema.vendor="kiss my" \
  org.label-schema.schema-version="1.0.0"

ENV PATH "$PATH:/root/.local/bin" 
RUN pip install awscli --upgrade --user --no-cache-dir && \
    pip install --user --no-cache-dir aws-sam-cli
ADD script.sh /bin/
RUN chmod +x /bin/script.sh
ENTRYPOINT /bin/script.sh
