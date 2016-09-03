FROM hokiegeek/scala-sbt:0.13.12-2.11.8

RUN mkdir ~/.ammonite
ADD predef.scala ~/.ammonite/predef.scala

RUN curl -Ls -o /bin/amm https://github.com/lihaoyi/Ammonite/releases/download/0.6.2/ammonite-repl-0.6.2-2.11.8 && chmod +x /bin/amm
RUN echo 'println("hw")' > hw.scala && /bin/amm hw.scala 2>/dev/null a && rm -rf hw.scala

ENTRYPOINT ["/bin/amm"]
