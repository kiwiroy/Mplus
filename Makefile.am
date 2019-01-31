
bin_PROGRAMS = m+1

m_1_SOURCES = mp.cpp m+.cpp m+.hpp aStar.cpp

m_1_CXXFLAGS = -std=c++11 -Wall $(OPENMP_CXXFLAGS)


GIT_TAG=v$(PACKAGE_VERSION)
GH_USER=$(shell git config --get credential.https://github.com.username)
GH_REPO=Mplus
GH_TOKEN=$(shell git config --get credential.https://github.com.username)
GH_RELEASE_NAME=abc321

# similar to https://stackoverflow.com/a/21875485/7456461
gh-release: distcheck
	@echo git tag $(GIT_TAG)
	@echo git push
	@echo git push --tags
	@echo github-release release --security-token $(GH_TOKEN) \
	   --user $(GH_USER) --repo $(GH_REPO) --tag $(GIT_TAG)
	@echo github-release upload  --security-token $(GH_TOKEN) \
	   --user $(GH_USER) --repo $(GH_REPO) --tag $(GIT_TAG) \
           --name '$(GH_RELEASE_NAME)' --file $(distdir).tar.gz
