BINDIR := bin
SRCDIR := src
TARGETS := $(patsubst $(SRCDIR)/%.sh,$(BINDIR)/%,$(wildcard $(SRCDIR)/*.sh))

all: $(TARGETS)

$(BINDIR)/%: $(SRCDIR)/%.sh
	mkdir -p $(BINDIR)
	docker run -it -v `pwd`/$(SRCDIR):/src -v `pwd`/$(BINDIR):/out alpine /bin/ash -c '/src/$(<F) && cp /usr/local/sbin/xinetd /out/$(@F)'

clean:
	rm -rf $(BINDIR)

.PHONY: all clean
