// Copyright (C) 2018 Storj Labs, Inc.
// See LICENSE for copying information.

<template>
    <div>
        <EmptyState
            mainTitle="Choose or Create new project"
            :imageSource="emptyImage" />
    </div>
</template>

<script lang="ts">
    import { Component, Vue } from 'vue-property-decorator';
    import EmptyState from '@/components/common/EmptyStateArea.vue';
    import { EMPTY_STATE_IMAGES } from '@/utils/constants/emptyStatesImages';

    @Component(
        {
            data: function () {
                return {
                    emptyImage: EMPTY_STATE_IMAGES.PROJECT,
                };
            },
            components: {
                EmptyState,
            }
        }
    )

    export default class DashboardArea extends Vue {
    }
</script>

<style scoped lang="scss">

</style>
