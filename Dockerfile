FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

COPY Fibonacci.java .

RUN javac Fibonacci.java

CMD ["java", "Fibonacci"]
