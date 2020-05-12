FROM amazon/aws-cli

RUN yum install -y jq

COPY main.sh /main.sh

ENTRYPOINT ["/main.sh"]