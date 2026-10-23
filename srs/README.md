# Local SRS streaming spike

This development stack accepts RTMP on `localhost:1935` and serves HLS on
`http://localhost:8080`. Ports are bound to loopback so the unauthenticated
development origin is not exposed to the network.

Start SRS with a generated 720p test stream:

```sh
docker compose --profile test up
```

After the publisher starts, verify the playlist:

```sh
curl --fail http://localhost:8080/live/demo.m3u8
```

Stop the stack with `Ctrl+C`, or run `docker compose --profile test down` from
another terminal.

The two-second fragment setting is a target, not a guarantee: SRS also waits
for keyframes, so the encoder GOP must be no longer than two seconds. This
test publisher uses a 60-frame GOP at 30 fps. SRS documents optimized HLS
latency at roughly 6-8 seconds; this setup does not meet a sub-five-second
glass-to-glass target. Test latency separately from control-message latency.

This is the local ingest-to-HLS spike only. Production ingest authentication,
NVENC, persistent segment storage, and automatic studio-disconnect fallback
remain out of scope.