# SRS media server: RTMP ingest on 1935, HLS over HTTP on 8080.
FROM ossrs/srs:6
COPY srs/srs.conf /usr/local/srs/conf/srs.conf
EXPOSE 1935 8080
CMD ["./objs/srs", "-c", "conf/srs.conf"]
