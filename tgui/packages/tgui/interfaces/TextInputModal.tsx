<<<<<<< HEAD
import { Loader } from './common/Loader';
import { InputButtons } from './common/InputButtons';
import { useBackend, useLocalState } from '../backend';
import { KEY_ENTER, KEY_ESCAPE } from '../../common/keycodes';
import { Box, Section, Stack, TextArea } from '../components';
import { Window } from '../layouts';
=======
import { KEY } from 'common/keys';
import { useState } from 'react';

import { useBackend } from '../backend';
import { Box, Section, Stack, TextArea } from '../components';
import { Window } from '../layouts';
import { InputButtons } from './common/InputButtons';
import { Loader } from './common/Loader';
>>>>>>> 6ccb751678c (Updates eslint + sorts imports (#80430))

type TextInputData = {
  large_buttons: boolean;
  max_length: number;
  message: string;
  multiline: boolean;
  placeholder: string;
  timeout: number;
  title: string;
};

export const sanitizeMultiline = (toSanitize: string) => {
  return toSanitize.replace(/(\n|\r\n){3,}/, '\n\n');
};

export const removeAllSkiplines = (toSanitize: string) => {
  return toSanitize.replace(/[\r\n]+/, '');
};

export const TextInputModal = (props) => {
  const { act, data } = useBackend<TextInputData>();
  const {
    large_buttons,
    max_length,
    message = '',
    multiline,
    placeholder,
    timeout,
    title,
  } = data;
  const [input, setInput] = useLocalState<string>('input', placeholder || '');
  const onType = (value: string) => {
    if (value === input) {
      return;
    }
    const sanitizedInput = multiline
      ? sanitizeMultiline(value)
      : removeAllSkiplines(value);
    setInput(sanitizedInput);
  };

  const visualMultiline = multiline || input.length >= 30;
  // Dynamically changes the window height based on the message.
  const windowHeight =
    135 +
    (message.length > 30 ? Math.ceil(message.length / 4) : 0) +
    (visualMultiline ? 75 : 0) +
    (message.length && large_buttons ? 5 : 0);

  return (
    <Window title={title} width={325} height={windowHeight}>
      {timeout && <Loader value={timeout} />}
      <Window.Content
        onKeyDown={(event) => {
          const keyCode = window.event ? event.which : event.keyCode;
          if (keyCode === KEY_ENTER && (!visualMultiline || !event.shiftKey)) {
            act('submit', { entry: input });
          }
          if (keyCode === KEY_ESCAPE) {
            act('cancel');
          }
        }}>
        <Section fill>
          <Stack fill vertical>
            <Stack.Item>
              <Box color="label">{message}</Box>
            </Stack.Item>
            <Stack.Item grow>
              <InputArea input={input} onType={onType} />
            </Stack.Item>
            <Stack.Item>
              <InputButtons
                input={input}
                message={`${input.length}/${max_length}`}
              />
            </Stack.Item>
          </Stack>
        </Section>
      </Window.Content>
    </Window>
  );
};

/** Gets the user input and invalidates if there's a constraint. */
const InputArea = (props) => {
  const { act, data } = useBackend<TextInputData>();
  const { max_length, multiline } = data;
  const { input, onType } = props;

  const visualMultiline = multiline || input.length >= 30;

  return (
    <TextArea
      autoFocus
      autoSelect
      height={multiline || input.length >= 30 ? '100%' : '1.8rem'}
      maxLength={max_length}
      onEscape={() => act('cancel')}
      onEnter={(event) => {
        if (visualMultiline && event.shiftKey) {
          return;
        }
        event.preventDefault();
        act('submit', { entry: input });
      }}
      onChange={(_, value) => onType(value)}
      placeholder="Type something..."
      value={input}
    />
  );
};
