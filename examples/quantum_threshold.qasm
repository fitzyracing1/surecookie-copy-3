OPENQASM 3.0;
include "stdgates.inc";

// Simple circuit demonstrating a threshold parameter (0.00014)
// and two gate-count modes: 1-gate and 8-gate.
// Use input gate_count = 1 or 8 to choose which path runs.

const float THRESHOLD = 0.00014;

input uint[4] gate_count;
qubit q;
output bit result;

// Apply a small phase as a baseline using the threshold.
p(q, THRESHOLD);

if (gate_count == 1) {
  // 1-gate path: single Hadamard.
  h(q);
} else {
  // 8-gate path: a simple sequence using THRESHOLD for small rotations.
  h(q);
  x(q);
  z(q);
  ry(q, THRESHOLD);
  rx(q, THRESHOLD);
  s(q);
  t(q);
  rz(q, THRESHOLD);
}

result = measure q;
