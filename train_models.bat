@echo off

REM Train model A three times
for /l %%x in (1, 1, 3) do (
    echo Training Model A - Run %%x
    python main.py --config cfgs/RSNA_AE.yaml --mode a
)

REM Train model B three times
for /l %%x in (1, 1, 3) do (
    echo Training Model B - Run %%x
    python main.py --config cfgs/RSNA_AE.yaml --mode b
)