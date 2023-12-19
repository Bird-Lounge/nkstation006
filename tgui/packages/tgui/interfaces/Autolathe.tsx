import { BooleanLike, classes } from 'common/react';
import { capitalize } from 'common/string';

import { useBackend } from '../backend';
<<<<<<< HEAD
import { LabeledList, Section, ProgressBar, Collapsible, Stack, Icon, Box, Tooltip, Button } from '../components';
=======
import {
  Box,
  Button,
  Collapsible,
  Icon,
  LabeledList,
  ProgressBar,
  Section,
  Stack,
  Tooltip,
} from '../components';
>>>>>>> 6ccb751678c (Updates eslint + sorts imports (#80430))
import { Window } from '../layouts';
import { DesignBrowser } from './Fabrication/DesignBrowser';
import { MaterialCostSequence } from './Fabrication/MaterialCostSequence';
import { Design, MaterialMap } from './Fabrication/Types';
import { Material } from './Fabrication/Types';

type AutolatheData = {
  materials: Material[];
  materialtotal: number;
  materialsmax: number;
  SHEET_MATERIAL_AMOUNT: number;
  designs: Design[];
  active: BooleanLike;
};

export const Autolathe = (props) => {
  const { data } = useBackend<AutolatheData>();
  const {
    materialtotal,
    materialsmax,
    materials,
    designs,
    active,
    SHEET_MATERIAL_AMOUNT,
  } = data;

  const filteredMaterials = materials.filter((material) => material.amount > 0);

  const availableMaterials: MaterialMap = {};

  for (const material of filteredMaterials) {
    availableMaterials[material.name] = material.amount;
  }

  return (
    <Window title="Autolathe" width={670} height={600}>
      <Window.Content scrollable>
        <Stack vertical fill>
          <Stack.Item>
            <Section title="Total Materials">
              <LabeledList>
                <LabeledList.Item label="Total Materials">
                  <ProgressBar
                    value={materialtotal}
                    minValue={0}
                    maxValue={materialsmax}
                    ranges={{
                      'good': [materialsmax * 0.85, materialsmax],
                      'average': [materialsmax * 0.25, materialsmax * 0.85],
                      'bad': [0, materialsmax * 0.25],
                    }}>
                    {materialtotal / SHEET_MATERIAL_AMOUNT +
                      '/' +
                      materialsmax / SHEET_MATERIAL_AMOUNT +
                      ' sheets'}
                  </ProgressBar>
                </LabeledList.Item>
                <LabeledList.Item>
                  {filteredMaterials.length > 0 && (
                    <Collapsible title="Materials">
                      <LabeledList>
                        {filteredMaterials.map((material) => (
                          <LabeledList.Item
                            key={material.name}
                            label={capitalize(material.name)}>
                            <ProgressBar
                              style={{
                                transform: 'scaleX(-1) scaleY(1)',
                              }}
                              value={materialsmax - material.amount}
                              maxValue={materialsmax}
                              backgroundColor={material.color}
                              color="black">
                              <div style={{ transform: 'scaleX(-1)' }}>
                                {material.amount / SHEET_MATERIAL_AMOUNT +
                                  ' sheets'}
                              </div>
                            </ProgressBar>
                          </LabeledList.Item>
                        ))}
                      </LabeledList>
                    </Collapsible>
                  )}
                </LabeledList.Item>
              </LabeledList>
            </Section>
          </Stack.Item>
          <Stack.Item grow>
            <DesignBrowser
              busy={!!active}
              designs={designs}
              availableMaterials={availableMaterials}
              buildRecipeElement={(
                design,
                availableMaterials,
                _onPrintDesign
              ) => (
                <AutolatheRecipe
                  design={design}
                  SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
                  availableMaterials={availableMaterials}
                />
              )}
            />
          </Stack.Item>
        </Stack>
      </Window.Content>
    </Window>
  );
};

type PrintButtonProps = {
  design: Design;
  quantity: number;
  availableMaterials: MaterialMap;
  SHEET_MATERIAL_AMOUNT: number;
  maxmult: number;
};

const PrintButton = (props: PrintButtonProps) => {
  const { act } = useBackend<AutolatheData>();
  const {
    design,
    quantity,
    availableMaterials,
    SHEET_MATERIAL_AMOUNT,
    maxmult,
  } = props;

  const canPrint = maxmult >= quantity;
  return (
    <Tooltip
      content={
        <MaterialCostSequence
          design={design}
          amount={quantity}
          SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
          available={availableMaterials}
        />
      }>
      <div
        className={classes([
          'FabricatorRecipe__Button',
          !canPrint && 'FabricatorRecipe__Button--disabled',
        ])}
        color={'transparent'}
        onClick={() =>
          canPrint && act('make', { id: design.id, multiplier: quantity })
        }>
        &times;{quantity}
      </div>
    </Tooltip>
  );
};

type AutolatheRecipeProps = {
  design: Design;
  availableMaterials: MaterialMap;
  SHEET_MATERIAL_AMOUNT: number;
};

const AutolatheRecipe = (props: AutolatheRecipeProps) => {
  const { act } = useBackend<AutolatheData>();
  const { design, availableMaterials, SHEET_MATERIAL_AMOUNT } = props;

  const maxmult = design.maxmult;
  const canPrint = maxmult > 0;

  return (
    <div className="FabricatorRecipe">
      <Tooltip content={design.desc} position="right">
        <div
          className={classes([
            'FabricatorRecipe__Button',
            'FabricatorRecipe__Button--icon',
            !canPrint && 'FabricatorRecipe__Button--disabled',
          ])}>
          <Icon name="question-circle" />
        </div>
      </Tooltip>
      <Tooltip
        content={
          <MaterialCostSequence
            design={design}
            amount={1}
            SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
            available={availableMaterials}
          />
        }>
        <div
          className={classes([
            'FabricatorRecipe__Title',
            !canPrint && 'FabricatorRecipe__Title--disabled',
          ])}
          onClick={() =>
            canPrint && act('make', { id: design.id, multiplier: 1 })
          }>
          <div className="FabricatorRecipe__Icon">
            <Box
              width={'32px'}
              height={'32px'}
              className={classes(['design32x32', design.icon])}
            />
          </div>
          <div className="FabricatorRecipe__Label">{design.name}</div>
        </div>
      </Tooltip>

      <PrintButton
        design={design}
        quantity={5}
        SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
        availableMaterials={availableMaterials}
        maxmult={maxmult}
      />

      <PrintButton
        design={design}
        quantity={10}
        SHEET_MATERIAL_AMOUNT={SHEET_MATERIAL_AMOUNT}
        availableMaterials={availableMaterials}
        maxmult={maxmult}
      />

      <div
        className={classes([
          'FabricatorRecipe__Button',
          !canPrint && 'FabricatorRecipe__Button--disabled',
        ])}>
        <Button.Input
          content={'[Max: ' + maxmult + ']'}
          color={'transparent'}
          maxValue={maxmult}
          onCommit={(_e, value: string) =>
            act('make', {
              id: design.id,
              multiplier: value,
            })
          }
        />
      </div>
    </div>
  );
};
