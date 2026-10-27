# Evaluation plan: does depot help on a real project?

A plan, not a result. Nothing here has been run. It exists because the committed results show the skills route and stop correctly, not that using depot produces better work than not using it (see [what is and is not shown](results/README.md#what-is-and-is-not-shown)).

## Question

On realistic repositories, does delivering a change with the depot workflow (`issue-to-merge`) beat the same builder working without depot, on quality, completion, time, cost, and unnecessary stops?

## Design

- **Subjects:** at least three real repositories of a meaningful size, not a scratch fixture. Use real or realistic defects and small features, with the expected behavior written down before any run. Include at least one defect with a subtle cause.
- **Arms:** (A) the builder alone with only the repository's own instructions; (B) the same builder with depot's `issue-to-merge` on the path its risk sets. Same task text, same model and effort, a fresh session per run.
- **Reviewers in arm B:** a different family from the builder where available. Run a second B variant with a same-family fresh-session reviewer on the same tasks, to see whether the family difference matters. State which was used for each run.
- **Repeats:** at least three runs per task per arm. A single run says almost nothing.
- **Held-out answers:** write each task's acceptance checks and expected findings before the first run. Do not edit them after any run; write a new task set instead. Keep answer keys out of the public repository until after scoring.

## Measures

| Measure | How |
| --- | --- |
| Output quality | Acceptance checks pass; hidden regression checks pass; a reviewer who did not see the arm scores the diff against the expected behavior |
| Completion rate | Share of runs that reach a mergeable change without a human fixing it |
| Time | Wall-clock and the person's attention time |
| Cost | Tokens or usage per run, by model |
| Unnecessary stops | Stops or questions where the information was already in the task or repository |
| Defects found by review | Real problems a review caught that the builder's own tests did not, and false findings |

## Reporting rules

- Report the number of runs, the models and families, and who wrote the tasks and scored them. Say plainly when the scorer is the author or the same family as a builder.
- Report failures and ties. A result where depot made no difference is a result.
- Do not compare a same-family review with a different-family review unless the same tasks ran both ways.

## Cost and approval

This is a large piece of work. It needs Ryan's go-ahead before it starts, an agreed budget, and a decision on which repositories to use.
