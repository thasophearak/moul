# Moul

Opinionated image resizing library.

## Installation

This package required static binary `https://github.com/moul-co/moul/releases` in PATH.

The package can be installed by adding `moul` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:moul, "~> 0.1.0"}
  ]
end
```

### Example

<details>
<summary>test/images/DSCF0527.JPG</summary>

```elixir
iex(1)> Moul.moulify("test/images/DSCF0527.JPG")
{:ok,
 %{
   hash: "yygKJQaEeJZ3B4rXhodHqHSHUGcH",
   height: "6240",
   width: "4160"
 }}
```

File created:

- xl: `test/images/DSCF0527/xl.jpeg`
- lg: `test/images/DSCF0527/lg.jpeg`
- md: `test/images/DSCF0527/md.jpeg`
- xs: `test/images/DSCF0527/xs.jpeg`

</details>

<details>

<summary>test/images/profile.png</summary>

```elixir
iex(1)> Moul.avatarize("test/images/profile.png")
{:ok,
 %{
   hash: "GwgSFwKLZYZ/eHZHZ1aWZ4iHyAgpjaAC",
   height: "1190",
   width: "1190"
 }}
```

File created:

- xl: `test/images/profile/xl.jpeg`
- lg: `test/images/profile/lg.jpeg`
- md: `test/images/profile/md.jpeg`
- xs: `test/images/profile/xs.jpeg`

</details>

#### Preview: `xl` | `blurhash` | `thumbhash`

|                                                                            |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| -------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| <img src="test/images/dscf3742-4k-by-phearak-s-tha/xl.jpeg" width="300" /> | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIABUAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AKGg+KYo5hzXdaD4hW62qK+XPCXx18M3s426rEee0gr1Lwp8YvDcZRjqMf8A32K+Iq5/XjHSDufo+E4JrOp70j6G0mEzwbh3FYnivTHYmuf8P/HLw0tsB/aEfT+8KzPFfx68MR5J1CL8XFedU4kx0I3UGetV4Lw1rOWp+Bej/Erx5o8mdN8VXkOTyUmIrqtM/aY+NmlqFg8eXbgdPMIP9K85i/1gq1X7JllGhWotVIJ69Umfl39r5rTknGvNf9vP/M9g0r9tf9oHT4/KXxUkg9ZYf8CKyvFH7XPx81vLzeOZYQR923jUD9QTXncPX8agvvufhXv43Kssp5c6kaMOa2/Kv8jN51m1Wp71eX3s/9k=" width="300" />                                                                                                                         | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIABcAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APD/ANmSW6RhIEPBr6g8L+KbyBRCkZzj0r5a/Zo+JfgmCDfLfxDnuwr6C8G/GT4dNqqRSalCeRxvFfI5jx9mrXws/Qsp8NsjT+NHbG31zU75Zkt3xnPSr+vRa1aWShrdhx6Vs2Pxx+EmkWqzT6hb5x3YVznjr9qf4UzR+XBf25x6MK8ijx3mzfws97EeHeRJfGj+e/wj+0L8TfByGLT9dkdT/fbkflW9o/7Ynxh0vURevrTOM8qGIrymivvKmDwtX4oL7j8pp43GUXeFRr5nu2u/t6fFjUrdYLfUZhgckykVH4b/AGsfiPrBK32pykjriQ14bW94J/1z/WlQyvAc9vZonGZvmSouXtWf/9k=" width="300" />                                                 |
| <img src="test/images/profile/xl.jpeg" width="300" />                      | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APuvR/2adQsm3GNvyrH+JPwHujproyn7pr6V1n4ieFbG3Z/OiHHqK8U+MP7QXhHT7eVWvIhgHqwoWYwqTu2elSwsqFJxR8ia/wDBWbRfEn2x8gB817x8F/Fdl4dsY7eeVRtAHWvDviv+0r4Ta9k8m+izk4w1cHb/ALScCP8A6JfDGezV9DSzVuioxPlKmStYt1UtzuvGP7YepT2LrBfsTjs9fIP7VH7W3j21sbm406aViAcYJrS8N6lca4/lyyE/jWf8VvhxYX+hyyTwKcoeor8plhsRKNpT5T6+GdUKsOeKufn74j/bz+Klx4ukS/uXSBJyskb5yOfXNfSPwa+Nl54k0qK6nuySygnLV8fftW+E9L8OeM7iSygVGNzt4GMjGa6v9mT4j3MVsthcScD5evQ/4Yr6DB4HH4mnF4C+l+ZNt/PXzPOXElKrSVWpBKLk1dLbW2vdeZ//2Q==" width="300" />                     | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAIAMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APcP+COn7HviXwnMPttk6/Va7P8A4Ksfsf6r4vTZHAxJHpX0n+z78aPhx8LbV5bbyEwOxArxL9ub9vbwTd3jQm4iIXpyKrB8RxUjfE5RJo+OPgP+xle+CLA3d2hULzyK+iPgzZab4fvDbPcqCvBGa+c/ir/wUU8NeH/DEwsLiNTtOMNXz94G/wCCjupax4klNpdMRvPQ19Rh+JoKO587XyWTke0+Ev2wZfEcDQ2urk7h2krwH9rL4l6rfTPcPqDnPT5q8P8A2OfE+u+Ir9Y57piCe5r0r9qHwxdjSPO3nO3rX5Lh8JJM/Qa2Ji0fPPxE8ZXGpaW8Et+xB6/NV79mDS9HudUaW7uRknu1cL4q8P6jLayfvDxnvTPg9NrGi6kwjuGHPrXtU8PNLc8ydWLZ/9k=" width="300" /> |
| <img src="test/images/DSCF0527/xl.jpeg" width="300" />                     | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAFQMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APwI07VbrTLxby3I3L2PQivfvhB+11ZaPZppPiO1aJlXAmAyp/LpXJ2v7HPxQnvks2SMb2A3BTivoH4Of8EtrnVbBNV18TXUpGQrAhR+A6/jXz2Y8UZBRjbEy5/Jbr/L5n2OW5PxLSpONJKMX3aav8r/AKGDfftIeGrqXzlvFwR61B/w0P4b/wCf1Pzr0vWv+Cchs7vyY9HbA9Fqn/w7ul/6A7/lXzf+ufCi05ZHof2dxkusPxPdo4PCdpqsRbyfvDjivrP9n9fB93ocanyj8o9K/DfVP2x/jHf3aXNvqEMITBClC2T9civa/gp/wVi8X+ALBLHxRoFxKyYHmWUgIb3IYjH0ya5sZwbiardTfyDAcXxjh1GS5X2f/A0P2O1nwl4Onuy4SH8hVT/hDPB//POD8hX5gyf8FpLeQ7hoWpj6ov8A8VTf+H0EH/QE1L/vhf8AGvEfBOMb+Bnrx4nptfHH/wACX+Z//9k=" width="300" /> | <img src="data:image/jpeg;charset=utf-8;base64,/9j/2wCEAAIBAQEBAQIBAQECAgICAgQDAgICAgUEBAMEBgUGBgYFBgYGBwkIBgcJBwYGCAsICQoKCgoKBggLDAsKDAkKCgoBAgICAgICBQMDBQoHBgcKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCgoKCv/AABEIACAAFwMBIgACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APxX0qz1OWEgxEcUum+EdWvtTBERxn0rrtD0zVG+T+z25/2K9A8CeANYv5lkj0xySeyV8/mvHDhE9zLuA5SldnnU3w+1PyV3RH8qh/4V9qP/ADzNe8ar8N/EyqoXR5P+/dUf+FdeKf8AoCy/98f/AFq+X/16k9U1959GuArI9Dsrn4G2UwJurbr6ivavgf4h/Z8M0azXVp+JFfkbda343zl9ZuuO/mVs+DfHnxN0y5DWet3AUHjMhr6LOeBrpnFgeMpU3qfunbRfs1X9sjNcWZ49RT/7J/Zn/wCe1l/30tfjfY/Hn4t20CxjXZ+B3kNTf8NBfFz/AKDs/wD32f8AGvi5cDO57q420P/Z" width="300" />                                                     |

### Documentation

Documentation can be found here: https://hexdocs.pm/moul
