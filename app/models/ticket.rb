class Ticket < ApplicationRecord
  belongs_to :user

  belongs_to :assigned_to,
             class_name: "User",
             optional: true

  has_many :comments, dependent: :destroy
  has_many :activities, dependent: :destroy
  has_many :notifications, dependent: :destroy
  has_many_attached :attachments
  

  enum :status, {
    open: 0,
    in_progress: 1,
    resolved: 2
  }

  enum :priority, {
    low: 0,
    medium: 1,
    high: 2
  }

  STATUS_LABELS = {
    "open"        => "Aberto",
    "in_progress" => "Em andamento",
    "resolved"    => "Resolvido"
  }.freeze

  PRIORITY_LABELS = {
    "low"    => "Baixa",
    "medium" => "Média",
    "high"   => "Alta"
  }.freeze

  SLA_LABELS = {
    "resolved"  => "Resolvido",
    "sem prazo" => "Sem prazo",
    "atrasado"  => "Atrasado",
    "vencendo"  => "Vencendo",
    "no prazo"  => "No prazo"
  }.freeze

  def self.status_options
    STATUS_LABELS.map { |k, v| [v, k] }
  end

  def self.priority_options
    PRIORITY_LABELS.map { |k, v| [v, k] }
  end

  validates :title, presence: true, length: { minimum: 3 }
  validates :description, presence: true, length: { minimum: 10 }

  before_validation :set_due_at, on: :create

  def sla_status
    return "resolved" if resolved?
    return "sem prazo" if due_at.blank?
    return "atrasado" if due_at < Time.current
    return "vencendo" if due_at <= 12.hours.from_now

    "no prazo"
  end

  def sla_hours
    case priority
    when "high"
      24
    when "medium"
      48
    when "low"
      72
    else
      72
    end
  end

  def status_label
    STATUS_LABELS[status]
  end

  def priority_label
    PRIORITY_LABELS[priority]
  end

  def sla_status_label
    SLA_LABELS[sla_status]
  end

  private

  def set_due_at
    return if due_at.present?

    self.due_at =
      case priority
      when "high"
        24.hours.from_now
      when "medium"
        48.hours.from_now
      when "low"
        72.hours.from_now
      else
        72.hours.from_now
      end
  end
end