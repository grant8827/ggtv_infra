# SRS media server: RTMP ingest on 1935, HLS over HTTP on 8080.
FROM ossrs/srs:6
COPY srs/srs.conf /usr/local/srs/conf/srs.conf
COPY --chmod=755 entrypoint.sh /usr/local/bin/ggtv-srs
EXPOSE 1935 8080
CMD ["/usr/local/bin/ggtv-srs"]
