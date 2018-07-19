#!/bin/bash

DEVICE=$1
NAME=$2

SENSOR_FILE="sensors/templates/zwave_battery.yaml"
GROUP_FILE="groups/zwave_battery.yaml"

usage() {
	echo "Usage: $0 [zwave entity_id] [name]"
	exit 1
}

if [ "${DEVICE}" == "" ]
then
    usage
	#exit 1
fi

if [ "${NAME}" == "" ]
then
    usage
	#exit 1
fi


echo "battery_zwave_${DEVICE}:" >> ${SENSOR_FILE}
echo "  entity_id: zwave.${DEVICE}" >> ${SENSOR_FILE}
echo "  value_template: \'{{ states.zwave.${DEVICE}.attributes.battery_level }}\'" >> ${SENSOR_FILE}
echo "  friendly_name: ${NAME}" >> ${SENSOR_FILE}
echo "  unit_of_measurement: \'%\'" >> ${SENSOR_FILE}
echo "" >> ${SENSOR_FILE}

echo "    - sensor.battery_zwave_${DEVICE}" >> ${GROUP_FILE}
