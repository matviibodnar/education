FROM ruby:3.4-slim
RUN apt-get update -y && apt-get install -y \
    build-essential \
    libnss3 \
    libgconf-2-4 \
    unzip \
    curl \
    libyaml-dev \
    chromium \
    chromium-driver \
    && rm -rf /var/lib/apt/lists/* # Clean up to reduce image size

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY . .
CMD ["rspec"]