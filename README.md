### Installation

```bash
gem install zion_data
```

### Usage

```bash
$ zion_data
Zion data manager version: 0.1.0
=== Get loopholes
=== Get sentinels
=== Get sniffers
=== Post loopholes data: {:start_node=>"gamma", :end_node=>"theta", :start_time=>"2030-12-31T13:00:04", :end_time=>"2030-12-31T13:00:05"}
    (•̀_•́ ) -> Targeting... almost there. Lock! I got him!
    (⌐■_■) -> Now, Tank now!
    -------- -> --------
    ヽ(´‿｀)ノ -> Welcome to the real world, Neo.
=== Post loopholes data: {:start_node=>"theta", :end_node=>"lambda", :start_time=>"2030-12-31T13:00:05", :end_time=>"2030-12-31T13:00:06"}
    (•̀_•́ ) -> Targeting... almost there. Lock! I got him!
    (⌐■_■) -> Now, Tank now!
    -------- -> --------
    ヽ(´‿｀)ノ -> Welcome to the real world, Neo.
...
```

```ruby
require 'zion_data'
require 'pp'
pp ZionData.sources # returns parsed sources
#{"loopholes"=>
#  [{:start_node=>"gamma",
#    :end_node=>"theta",
#    :start_time=>"2030-12-31T13:00:04",
#    :end_time=>"2030-12-31T13:00:05"},
#   {:start_node=>"theta",
#    :end_node=>"lambda",
#    :start_time=>"2030-12-31T13:00:05",
#    :end_time=>"2030-12-31T13:00:06"},
#   {:start_node=>"beta",
#    :end_node=>"theta",
#    :start_time=>"2030-12-31T13:00:05",
#    :end_time=>"2030-12-31T13:00:06"},
#   {:start_node=>"theta",
#    :end_node=>"lambda",
#    :start_time=>"2030-12-31T13:00:06",
#    :end_time=>"2030-12-31T13:00:07"}],
# "sentinels"=>
#  [{:start_node=>"beta",
#    :end_node=>"beta",
#    :start_time=>"2030-12-31T13:00:02",
#    :end_time=>"2030-12-31T13:00:03"},
#   {:start_node=>"gamma",
#    :end_node=>"gamma",
#    :start_time=>"2030-12-31T13:00:03",
#    :end_time=>"2030-12-31T13:00:04"}],
# "sniffers"=>
#  [{:start_node=>"lambda",
#    :end_node=>"tau",
#    :start_time=>"2030-12-31T13:00:06",
#    :end_time=>"2030-12-31T13:00:07"},
#   {:start_node=>"tau",
#    :end_node=>"psi",
#    :start_time=>"2030-12-31T13:00:06",
#    :end_time=>"2030-12-31T13:00:07"},
#   {:start_node=>"psi",
#    :end_node=>"omega",
#    :start_time=>"2030-12-31T13:00:06",
#    :end_time=>"2030-12-31T13:00:07"},
#   {:start_node=>"lambda",
#    :end_node=>"psi",
#    :start_time=>"2030-12-31T13:00:07",
#    :end_time=>"2030-12-31T13:00:08"},
#   {:start_node=>"psi",
#    :end_node=>"omega",
#    :start_time=>"2030-12-31T13:00:07",
#    :end_time=>"2030-12-31T13:00:08"}]}
```