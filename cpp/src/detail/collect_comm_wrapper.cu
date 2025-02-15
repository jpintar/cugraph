/*
 * Copyright (c) 2023, NVIDIA CORPORATION.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <c_api/capi_helper.hpp>
#include <structure/detail/structure_utils.cuh>

#include <cugraph/detail/shuffle_wrappers.hpp>
#include <cugraph/utilities/misc_utils.cuh>
#include <utilities/collect_comm.cuh>

#include <thrust/iterator/zip_iterator.h>
#include <thrust/sort.h>

namespace cugraph {
namespace detail {

template <typename T>
rmm::device_uvector<T> device_allgatherv(raft::handle_t const& handle,
                                         raft::comms::comms_t const& comm,
                                         raft::device_span<T const> d_input)
{
  auto gathered_v = cugraph::device_allgatherv(handle, comm, d_input);

  return gathered_v;
}

template rmm::device_uvector<int32_t> device_allgatherv(raft::handle_t const& handle,
                                                        raft::comms::comms_t const& comm,
                                                        raft::device_span<int32_t const> d_input);

template rmm::device_uvector<int64_t> device_allgatherv(raft::handle_t const& handle,
                                                        raft::comms::comms_t const& comm,
                                                        raft::device_span<int64_t const> d_input);

template rmm::device_uvector<float> device_allgatherv(raft::handle_t const& handle,
                                                      raft::comms::comms_t const& comm,
                                                      raft::device_span<float const> d_input);

template rmm::device_uvector<double> device_allgatherv(raft::handle_t const& handle,
                                                       raft::comms::comms_t const& comm,
                                                       raft::device_span<double const> d_input);

}  // namespace detail
}  // namespace cugraph
