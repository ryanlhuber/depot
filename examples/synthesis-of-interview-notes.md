# Example: synthesis of interview notes

Demonstrates [Research Synthesis](../skills/ux/research-synthesis/SKILL.md) with its [insight table template](../skills/ux/research-synthesis/templates/insight-table.md). The product, participants, and quotes are fictional. This example is illustrative and is not canonical guidance.

## Input

Notes from eight 30-minute interviews with bookkeepers who use a fictional invoicing tool. Research question: where does invoice entry slow them down?

The notes, in brief:

- S1: re-enters data from other systems; likes keyboard shortcuts.
- S2: "I type the PO number again every time"; distrusts import but still uses it.
- S3: enters most invoices without the mouse; likes keyboard shortcuts; reports no slowdown.
- S4: re-enters data from other systems.
- S5: stopped using import after a duplicate batch.
- S6: copies totals from a spreadsheet each week.
- S7: re-enters data from other systems.
- S8: checks every imported row by hand.

## Research synthesis

### Sources
| ID | Participant | Method | Notes |
| --- | --- | --- | --- |
| S1–S8 | Eight bookkeepers at small firms (1–10 staff) | Remote interview | Recruited by the product team from active customers |

Total sources: 8. **Sampling limits:** all participants are current customers recruited by the vendor; people who left the product are not represented.

### Research questions
1. Where does invoice entry slow users down? — **Partly answered.** Data re-entry is clear; causes of the import problem are unclear.

### Themes
| Theme | Supporting | Contradicting | Key observations |
| --- | --- | --- | --- |
| Re-entering data that exists elsewhere | S1, S2, S4, S6, S7 (5 of 8) | S3 | "I type the PO number again every time" (S2); S6 copies totals from a spreadsheet each week |
| Import feels risky | S2, S5, S8 (3 of 8) | | S5 stopped using import after a duplicate batch; S8 checks every imported row by hand |
| Keyboard shortcuts are valued | S1, S3 (2 of 8) | | S3 enters most invoices without the mouse |

### Insights
| ID | Insight (interpretation) | Theme | Implication | Confidence | Basis |
| --- | --- | --- | --- | --- | --- |
| I1 | Re-entry of data that already exists elsewhere is the main source of slowdown in invoice entry. | Re-entering data | Reducing re-entry would address the question most directly. | Medium | 5 of 8 describe it, all accounts are self-reported |
| I2 | Distrust of import pushes some users back to manual entry, which adds to re-entry. | Import feels risky | Import reliability may be a precondition for solving I1 by import. | Low | 3 of 8; one clear behavior change (S5), the others describe caution |

### Contradictions and outliers
- S3 does not re-enter data and relies on keyboard entry, and reports no slowdown. S3 may represent a fast-path user. Whether keyboard shortcuts offset re-entry is not answerable from this material.
- S2 and S5 describe import differently: S2 distrusts it but still uses it, while S5 stopped. Behavior is weighted over stated caution, so S5's change is the stronger evidence.

### Gaps and next research
- Why imports fail or feel risky is not covered. Next: review the duplicate-batch cases with S5 and S8, or sample support tickets about import.
- No former customers were interviewed. Next: recruit lapsed users to check whether import distrust contributes to churn.

### Source note
Counts are reported as numbers of sources, not percentages, because the sample is eight. Nothing here supports a claim about bookkeepers in general.
