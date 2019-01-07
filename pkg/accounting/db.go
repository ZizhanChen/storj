// Copyright (C) 2018 Storj Labs, Inc.
// See LICENSE for copying information.

package accounting

import (
	"context"
	"time"

	"storj.io/storj/pkg/pb"
	"storj.io/storj/pkg/storj"
)

//BWTally is a convience alias
type BWTally [pb.PayerBandwidthAllocation_PUT_REPAIR + 1]map[string]int64

// DB stores information about bandwidth usage
type DB interface {
	// LastRawTime records the latest last tallied time.
	LastRawTime(ctx context.Context, timestampType string) (time.Time, bool, error)
	// SaveBWRaw records raw sums of agreement values to the database and updates the LastRawTime.
	SaveBWRaw(ctx context.Context, latestBwa time.Time, bwTotals BWTally) error
	// SaveAtRestRaw records raw tallies of at-rest-data.
	SaveAtRestRaw(ctx context.Context, latestTally time.Time, nodeData map[storj.NodeID]int64) error
}
