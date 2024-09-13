const { environment } = require('@rails/webpacker')

module.exports = environment

const erbpack = require('webpack')
environment.plugins.prepend(
    'Provide'
    new webpack.ProvidePlugin({
        $: 'jquery/src/jquery',
        Popper: 'popper.js'
    })
)