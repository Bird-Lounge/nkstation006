import { BooleanLike } from 'common/react';

import { useBackend } from '../backend';
<<<<<<< HEAD
<<<<<<< HEAD
import { Button, Flex, Knob, NumberInput, LabeledControls, Section } from '../components';
=======
=======
>>>>>>> 2631b0b8ef1 (Replaces prettierx with the normal prettier (#80189))
import {
  Button,
  Flex,
  Knob,
<<<<<<< HEAD
  LabeledControls,
  NumberInput,
  Section,
} from '../components';
>>>>>>> 6ccb751678c (Updates eslint + sorts imports (#80430))
=======
  NumberInput,
  LabeledControls,
  Section,
} from '../components';
>>>>>>> 2631b0b8ef1 (Replaces prettierx with the normal prettier (#80189))
import { Window } from '../layouts';

type Data = {
  temperature: number;
  fluid_type: string;
  minTemperature: number;
  maxTemperature: number;
  fluidTypes: string[];
  contents: { ref: string; name: string }[];
  allow_breeding: BooleanLike;
  feeding_interval: number;
};

export const Aquarium = (props) => {
  const { act, data } = useBackend<Data>();
  const {
    temperature,
    fluid_type,
    minTemperature,
    maxTemperature,
    fluidTypes,
    contents,
    allow_breeding,
    feeding_interval,
  } = data;

  return (
    <Window width={520} height={400}>
      <Window.Content>
        <Section title="Aquarium Controls">
          <LabeledControls>
            <LabeledControls.Item label="Temperature">
              <Knob
                size={1.25}
                mb={1}
                value={temperature}
                unit="K"
                minValue={minTemperature}
                maxValue={maxTemperature}
                step={1}
                stepPixelSize={1}
                onDrag={(_, value) =>
                  act('temperature', {
                    temperature: value,
                  })
                }
              />
            </LabeledControls.Item>
            <LabeledControls.Item label="Fluid">
              <Flex direction="column" mb={1}>
                {fluidTypes.map((f) => (
                  <Flex.Item key={f}>
                    <Button
                      fluid
                      content={f}
                      selected={fluid_type === f}
                      onClick={() => act('fluid', { fluid: f })}
                    />
                  </Flex.Item>
                ))}
              </Flex>
            </LabeledControls.Item>
            <LabeledControls.Item label="Reproduction Prevention">
              <Button
                content={allow_breeding ? 'Offline' : 'Online'}
                selected={!allow_breeding}
                onClick={() => act('allow_breeding')}
              />
            </LabeledControls.Item>
            <LabeledControls.Item label="Feeding Interval">
              <NumberInput
                fluid
                value={feeding_interval}
                minValue={1}
                maxValue={7}
                unit="minutes"
                onChange={(e, value) =>
                  act('feeding_interval', {
                    feeding_interval: value,
                  })
                }
              />
            </LabeledControls.Item>
          </LabeledControls>
        </Section>
        <Section title="Contents">
          {contents.map((movable) => (
            <Button
              key={movable.ref}
              content={movable.name}
              onClick={() => act('remove', { ref: movable.ref })}
            />
          ))}
        </Section>
      </Window.Content>
    </Window>
  );
};
