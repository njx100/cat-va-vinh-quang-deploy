# Shim deploy cho Render: keo ma nguon that tu Codeberg khi build.
FROM oven/bun:1
WORKDIR /app
ADD https://codeberg.org/dnnguyen100/cat-va-vinh-quang/archive/main.tar.gz /tmp/src.tar.gz
RUN tar -xzf /tmp/src.tar.gz -C /app --strip-components=1 && rm /tmp/src.tar.gz
RUN bun install --frozen-lockfile || bun install
RUN bun run build
ENV PORT=8080
EXPOSE 8080
CMD ["bun", "run", "server/src/index.ts"]
