package swarm

import (
	"testing"

	"github.com/docker/cli/cli/command/stack/options"
	"github.com/docker/cli/internal/test"
	"gotest.tools/assert"
	is "gotest.tools/assert/cmp"
)

func TestRunPSWithEmptyName(t *testing.T) {
	client := &fakeClient{}
	dockerCli := test.NewFakeCli(client)

	err := RunPS(dockerCli, options.PS{Namespace: "'   '"})
	assert.Check(t, is.Error(err, `invalid stack name: "'   '"`))
}
