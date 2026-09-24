final class ProgramBlock {
  const ProgramBlock({
    required this.id,
    required this.programId,
    required this.name,
    required this.blockOrder,
    this.focus,
  });

  final String id;
  final String programId;
  final String name;
  final int blockOrder;
  final String? focus;
}
