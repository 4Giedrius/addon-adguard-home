#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: AdGuard Home
# Sends discovery information to Home Assistant.
# ==============================================================================
declare config
declare payload

config=$(\
    bashio::var.json \
        host "127.0.0.1" \
        port "^45158" \
)

payload=$(\
    bashio::var.json \
        service adguard \
        config "^${config}" \
)

if bashio::api.hassio "POST" "/discovery" "${payload}"; then
    bashio::log.info "Successfully send discovery information to Home Assistant."
else
    bashio::log.error "Discovery message to Home Assistant failed!"
fi