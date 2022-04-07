I combine the features of PluggableDictionary and WeakKeyDictionary, i.e., clients can supply custom blocks for comparing and hasing my keys, and I hold weakly on my keys.

TODO: Contribute upstream. Revise the architecture to inherit from PluggableDictionary. See: http://lists.squeakfoundation.org/pipermail/squeak-dev/2022-January/218017.html